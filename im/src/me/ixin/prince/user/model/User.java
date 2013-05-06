package me.ixin.prince.user.model;

import java.util.Date;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Name;
import org.nutz.dao.entity.annotation.Readonly;
import org.nutz.dao.entity.annotation.Table;
import org.nutz.dao.entity.annotation.View;

@Table("t_user")
@View("v_user")
public class User {
	@Column
	@Id
	private Integer id;
	@Column
	@Name(casesensitive=false)
	private String username;
	@Column
	private String nickname;
	@Column
	private String email;
	@Column
	private String url;
	@Column
	private Date regDate;
	@Column
	private Integer status;//0代表正常 1代表已删除 2代表未审核 3代表限制登录
	
	@Readonly
	private Integer postCount;
	
}
