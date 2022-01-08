package com.test.ajax.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.test.ajax.domain.User;

@RestController
@RequestMapping("ajax")
public class AjaxDemoController {
	
	/**
	 * 用于测试ajax的异步
	 * produces={"test/plain;charset=utf-8"}设置响应格式和编码格式
	 * @param name
	 * @param age
	 * @return
	 */
	@RequestMapping(value="test",produces={"test/plain;charset=utf-8"})
	public String test(String name,Integer age){
		try {
			Thread.sleep(2000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		System.out.println("hello world: " + name + ", " + age);
		return "hello world: " + name + ", " + age;
	}
	/**
	 * 用于传递users类的参数
	 * @return
	 */
	@RequestMapping(value="users",produces={"test/plain;charset=utf-8"})
	public String users(){
		List<User> list = new ArrayList<User>();
		list.add(new User("定辉",20));
		list.add(new User("凌彬",21));
		list.add(new User("少鹏",20));
		return list.toString();
	}
	/*@RequestMapping(value="users",produces={"test/plain;charset=utf-8"})
	public String users(){
		List<User> list = new ArrayList<User>();
		list.add(new User("张三",11));
		list.add(new User("李四",12));
		list.add(new User("王五",13));
		return list.toString();
	}*/
}
