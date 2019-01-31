package org.hwx.junitAOP;

import static org.junit.Assert.*;

import org.junit.Test;

public class UtilityClassTestNeg {

	@report_task(name="concatinate test method", owner="concatinate team")
	@Test
	public void testConcatinate() {		
		UtilityClass util = new UtilityClass();
		String res = util.concatinate("One ", "Two");
		//TestUtil tu = new TestUtil();
		assertNotEquals(TestUtil.getRandomStr(5), res);
	}
	

	@report_task()
	@Test
	public void testMultiply() {
		UtilityClass util = new UtilityClass();
		int res = util.multiply(5, 13);
		TestUtil tu = new TestUtil();
		assertEquals(tu.getRandomInt(), res);
	}

}
