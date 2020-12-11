package com.watero.exception;

/**
 * 	访问拒绝的异常
 * 
 * @author Yang
 *
 */
public class RoleOptionException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	public RoleOptionException() {
		super();
	}

	public RoleOptionException(String message, Throwable cause, boolean enableSuppression,
                               boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public RoleOptionException(String message, Throwable cause) {
		super(message, cause);
	}

	public RoleOptionException(String message) {
		super(message);
	}

	public RoleOptionException(Throwable cause) {
		super(cause);
	}

}
