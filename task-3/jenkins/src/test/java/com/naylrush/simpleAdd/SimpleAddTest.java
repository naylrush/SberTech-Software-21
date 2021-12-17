package com.naylrush.simpleAdd;

import org.junit.Test;
import java.lang.Math;

import static org.junit.Assert.assertEquals;

public class SimpleAddTest {

    @Test
    public void testAdd() {
        SimpleAdd simpleAdd = new SimpleAdd();

        double x = 16;
        double y = -3;

        assertEquals(13, simpleAdd.add(x, y), Math.ulp(1));
    }

}
