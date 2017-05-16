/**
 * 
 */
package com.bidding.web.utils;

/**
 * @author Manisha
 *
 */
import java.util.List;

import com.bidding.web.model.Item;
import com.bidding.web.model.User;
import com.whalin.MemCached.MemCachedClient;
import com.whalin.MemCached.SockIOPool;

public class MemCacheUtils	 {

	//private static final Logger logger = LogManager.getLogger(MemCacheUtil.class);
	private static MemCachedClient cacheClient = null;

	static {
		String[] server = { "localhost:11211" };
		SockIOPool sockPool = SockIOPool.getInstance("utdbids");
		sockPool.setServers(server);
		sockPool.setFailover(true);
		sockPool.setInitConn(10);
		sockPool.setMinConn(5);
		sockPool.setMaxConn(250);
		sockPool.setMaintSleep(30);
		sockPool.setNagle(false);
		sockPool.setSocketTO(3000);
		sockPool.setAliveCheck(true);
		sockPool.initialize();
		cacheClient = new MemCachedClient("utdbids");
	
	}

	public static boolean keepInCache(String key, List<Item> value) {
		System.out.println("cache out value");
		return cacheClient.set(key, value);
	}

	public static List<Item> getKeyFromCache(String key) {
		Object value = cacheClient.get(key);
		if (value == null) {
			System.out.println("Search Keyword Not Present"+key+" - Cache Miss");
			return null;
			
		} else {
			System.out.println("Search Keyword Present-"+key+" Cache Hit");
			return (List<Item>) value;
		}
	}

	public static void removeKeyFromCache(String key) {
		cacheClient.delete(key);
	    System.out.println("cache remove");
	}

}
