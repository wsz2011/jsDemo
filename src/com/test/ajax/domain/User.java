package com.test.ajax.domain;
/**
 * User实体类，用于接收参数
 * @author 80793
 *
 */
public class User {
	//1.无参+有参，用于设置对应参数
	public User(){}
	public User(String name,Integer age){
		this.name = name;
		this.age = age;
	}
	String name;
	Integer age;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	@Override
	public String toString() {
		return "{name:" + name + ",age:" + age + "}";
	}
}
