package me.ixin.prince.post.dao.impl;

import java.util.List;

import org.nutz.dao.Dao;
import org.nutz.dao.QueryResult;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.annotation.InjectName;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;

import me.ixin.prince.post.dao.PostDao;
import me.ixin.prince.post.model.Post;
import me.ixin.prince.post.web.command.PostCommand;

@InjectName("postDao")
@IocBean
public class PostDaoImpl implements PostDao {
	@Inject("refer:dao")
	private Dao dao;
	
	@Override
	public Post savePost(Post post) {
		return dao.insert(post);
	}

	@Override
	public int updatePost(Post post) {
		return dao.update(post);
	}

	@Override
	public int delPost(Long id) {
		return dao.delete(Post.class, id);
	}

	@Override
	public Post findPostByID(Long id) {
		return dao.fetch(Post.class, id);
	}

	@Override
	public QueryResult getPosts(PostCommand command, int pageNumber, int pageSize) {
		Pager pager = dao.createPager(pageNumber, pageSize);
		List<Post> list = dao.query(Post.class, null, pager);//注意  条件 还没写
		pager.setRecordCount(dao.count(Post.class));
		return new QueryResult(list, pager);
	}


}
