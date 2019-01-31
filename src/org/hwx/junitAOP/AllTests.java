package org.hwx.junitAOP;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

@RunWith(Suite.class)
@SuiteClasses({ UtilityClassTestNeg.class, UtilityClassTestPositive.class })
public class AllTests {

}
