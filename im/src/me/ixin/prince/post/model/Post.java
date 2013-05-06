package me.ixin.prince.post.model;

import java.util.Date;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Readonly;
import org.nutz.dao.entity.annotation.Table;
import org.nutz.dao.entity.annotation.View;

@Table("t_post")
@View("v_post")
public class Post {
	@Column
	@Id
	private Long id;
	@Column
	private String name;
	@Column
	private String summary;
	@Column
	private Date createOn;
	@Column
	private Integer createBy;
	@Column
	private String content;
	@Column
	private Integer readNumber;
	@Column
	private Integer status;//0 代表发布    1代表草稿	2代表垃圾箱	3代表已删除
	
	@Readonly
	private String createByName;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getCreateOn() {
		return createOn;
	}
	public void setCreateOn(Date createOn) {
		this.createOn = createOn;
	}
	public Integer getCreateBy() {
		return createBy;
	}
	public void setCreateBy(Integer createBy) {
		this.createBy = createBy;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getReadNumber() {
		return readNumber;
	}
	public void setReadNumber(Integer readNumber) {
		this.readNumber = readNumber;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	
}
