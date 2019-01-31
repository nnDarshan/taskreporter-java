package org.hwx.junitAOP;

import static org.junit.Assert.*;

import org.junit.Test;

public class UtilityClassTestPositive {

	@report_task()
	@Test
	public void testConcatinate() {		
		UtilityClass util = new UtilityClass();
		String res = util.concatinate("One", "Two");
		assertEquals("OneTwo", res);
	}
	

	@report_task(name="multiply test method", owner="Multiply team")
	@Test
	public void testMultiply() {
		UtilityClass util = new UtilityClass();
		int res = util.multiply(5, 3);
		assertEquals(15, res);
	}

}
