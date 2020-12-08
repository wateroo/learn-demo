package com.watero.util;

/**
 * 统一ajax请求的返回结果
 * 
 * @author Yang
 *
 * @param <T>
 */
public class ResultEntity<T> {
	private static final String SUCCESS = "SUCCESS";
	private static final String FALILED = "FALILED";
	/**
	 * 用来封装当前请求的处理结果
	 */
	private String code;
	/**
	 * 请求处理失败的错误消息
	 */
	private String message;

	/**
	 * 返回数据
	 */
	private T data;

	public ResultEntity() {
		this.code = "200";
		this.message = "请求成功";
	}

	public ResultEntity(String code, String message, T data) {
		super();
		this.code = code;
		this.message = message;
		this.data = data;
	}

	/*
	 * <Type> 声明一个泛型
	 */
	public static <Type> ResultEntity<Type> successWithoutData() {
		return new ResultEntity<Type>();
	}

	public static <Type> ResultEntity<Type> successWithData(Type data) {
		return new ResultEntity<Type>(SUCCESS, null, data);
	}

	public static <Type> ResultEntity<Type> faliledWithData(String message) {
		return new ResultEntity<Type>(FALILED, message, null);
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

}
