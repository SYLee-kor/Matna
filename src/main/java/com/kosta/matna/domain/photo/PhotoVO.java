package com.kosta.matna.domain.photo;

import org.springframework.web.multipart.MultipartFile;

public class PhotoVO {
	private MultipartFile Filedata;
	private String callback;
	private String callback_func;

	public PhotoVO() {
	}

	public PhotoVO(MultipartFile filedata, String callback, String callback_func) {
		Filedata = filedata;
		this.callback = callback;
		this.callback_func = callback_func;
	}

	public MultipartFile getFiledata() {
		return Filedata;
	}

	public void setFiledata(MultipartFile filedata) {
		Filedata = filedata;
	}

	public String getCallback() {
		return callback;
	}

	public void setCallback(String callback) {
		this.callback = callback;
	}

	public String getCallback_func() {
		return callback_func;
	}

	public void setCallback_func(String callback_func) {
		this.callback_func = callback_func;
	}
}