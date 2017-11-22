package com.choice.mapper;

public interface JedisClient {
	String set(String key,String value);
	String get(String key);
	long hset(String hkey,String key,String value);
	String hget(String hkey,String key);
	long incr(String key);
	long expire(String key,int second);
	long ttl(String key);
	long del(String key);
	long hdel(String hkey,String key);

}
