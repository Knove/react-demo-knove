package test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import com.choice.mapper.JedisClient;

public class testRedis {
	/*@Autowired
	private JedisClient jedisClient;*/
	@Autowired
	private JedisPool jedisPool;
	
	@Test
	public void test() {
		if(jedisPool == null){
			System.out.println("null");
		}
		Jedis jedisClient = jedisPool.getResource();
		jedisClient.set("ss", "test");
		String result = jedisClient.get("ss");
		System.out.println(result);
		
	}

}
