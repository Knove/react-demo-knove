package com.choice.mapper.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.choice.mapper.JedisClient;

import redis.clients.jedis.JedisCluster;

public class JedisClientCluster implements JedisClient {

	@Autowired
	private JedisCluster jedisCluster;
	
	public String get(String key) {
		return jedisCluster.get(key);	
	}

	public String set(String key, String value) {
		return jedisCluster.set(key, value);
	}

	public String hget(String hkey, String key) {
		return jedisCluster.hget(hkey, key);
	}

	public long hset(String hkey, String key, String value) {
		return jedisCluster.hset(hkey, key, value);
	}

	public long incr(String key) {
		return jedisCluster.incr(key);
	}

	public long expire(String key, int second) {
		return jedisCluster.expire(key, second);
	}

	public long ttl(String key) {
		return jedisCluster.ttl(key);
	}

	public long del(String key) {
		// TODO Auto-generated method stub
		return jedisCluster.del(key);
	}

	public long hdel(String hkey, String key) {
		// TODO Auto-generated method stub
		return jedisCluster.hdel(hkey,key);
	}

}