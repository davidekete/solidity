/*
	This file is part of solidity.

	solidity is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	solidity is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with solidity.  If not, see <http://www.gnu.org/licenses/>.
*/
// SPDX-License-Identifier: GPL-3.0

#include <test/libyul/ssa/StackLayoutGeneratorTest.h>

#include <libyul/backends/evm/ssa/ControlFlow.h>
#include <libyul/backends/evm/ssa/SSACFGBuilder.h>
#include <libyul/backends/evm/ssa/StackLayoutGenerator.h>
#include <libyul/backends/evm/ssa/StackUtils.h>

#include <libyul/Common.h>
#include <libyul/YulStack.h>

using namespace solidity;
using namespace solidity::yul::ssa;
using namespace solidity::yul::ssa::test;

std::unique_ptr<frontend::test::TestCase> StackLayoutGeneratorTest::create(Config const& _config)
{
	return std::make_unique<StackLayoutGeneratorTest>(_config.filename);
}

StackLayoutGeneratorTest::StackLayoutGeneratorTest(std::string const& _filename): TestCase(_filename)
{
	m_source = m_reader.source();
	auto dialectName = m_reader.stringSetting("dialect", "evm");
	soltestAssert(dialectName == "evm");
	m_expectation = m_reader.simpleExpectations();
}

frontend::test::TestCase::TestResult StackLayoutGeneratorTest::run(std::ostream& _stream, std::string const& _linePrefix, bool const _formatted)
{
	YulStack const yulStack = yul::test::parseYul(m_source);
	solUnimplementedAssert(yulStack.parserResult()->subObjects.empty(), "Tests with subobjects not supported.");
	if (yulStack.hasErrors())
	{
		yul::test::printYulErrors(yulStack, _stream, _linePrefix, _formatted);
		return TestResult::FatalError;
	}

	auto const& object = *yulStack.parserResult();
	std::unique_ptr<ControlFlow> const controlFlow = SSACFGBuilder::build(
		*object.analysisInfo,
		*object.dialect(),
		object.code()->root(),
		false
	);
	SSACFGStackLayout const layout = StackLayoutGenerator::generate(
		LivenessAnalysis(*controlFlow->mainGraph()),
		gatherCallSites(*controlFlow->mainGraph())
	);

	return checkResult(_stream, _linePrefix, _formatted);
}
