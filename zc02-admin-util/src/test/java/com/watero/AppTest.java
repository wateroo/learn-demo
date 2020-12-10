package com.watero;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.util.Arrays;
import java.util.List;

public class AppTest {
    @Test
    public void shouldAnswerWithTrue() {
        List<Integer> objects = Arrays.asList(new Integer[]{
                1, 2, 3, 4, 5, 6, 7
        });
        List<Integer> object = null;
        for (int i = 0; i < objects.size(); i++) {
            System.err.println(objects.get(i));
        }
        for (int i = 0; i < object.size(); i++) {
            System.err.println(objects.get(i));
        }

    }
}
