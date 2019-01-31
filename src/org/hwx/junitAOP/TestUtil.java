package org.hwx.junitAOP;

public class TestUtil {
	
	@report_task(name="RandomStr", owner="test util team")
	public static String getRandomStr(int x) {
		System.out.println(x);
		return "asdsdfsdfgsdfg";
	}
	
	@report_task()
	public int getRandomInt() {
		return -123;
	}
		
}
