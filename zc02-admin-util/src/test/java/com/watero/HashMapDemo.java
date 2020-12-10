package com.watero;

import java.util.HashMap;
import java.util.Map;

/**
 * 基于哈希表的实现的Map接口,不是同步实现，所以非线程安全。允许null的值和null键
 * Map m = Collections.synchronizedMap(new HashMap());
 * <p>
 * HashMap的一个实例有两个影响其性能的参数： 初始容量和负载因子
 * 容量是哈希表中的桶数，初始容量只是创建哈希表时的容量。
 * 负载因子是在容量自动增加之前允许哈希表得到满足的度量。
 * 当在散列表中的条目的数量超过了负载因数和电流容量的乘积，哈希表被重新散列 （即，内部数据结构被重建），使得哈希表具有桶的大约两倍
 * <p>
 * 构造方法
 * HashMap()
 * 1.构造一个空的 HashMap ，默认初始容量（16）和默认负载系数（0.75）。
 * <p>
 * HashMap(int initialCapacity)
 * 2.构造一个空的 HashMap具有指定的初始容量和默认负载因子（0.75）。
 * <p>
 * HashMap(int initialCapacity, float loadFactor)
 * 3.构造一个空的 HashMap具有指定的初始容量和负载因子。
 * <p>
 * 4.HashMap(Map<? extends K,? extends V> m)
 * 构造一个新的 HashMap与指定的相同的映射 Map 。
 */

public class HashMapDemo {
    public static void main(String[] args) {
        Map<String, String> map = new HashMap<>();
    }


}