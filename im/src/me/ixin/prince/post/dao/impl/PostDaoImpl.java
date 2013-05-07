package me.ixin.prince.post.dao.impl;

import org.nutz.dao.Dao;
import org.nutz.ioc.Ioc;
import org.nutz.ioc.annotation.InjectName;
import org.nutz.ioc.impl.NutIoc;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.ioc.loader.json.JsonLoader;

import me.ixin.prince.post.dao.PostDao;
import me.ixin.prince.post.model.Post;

@InjectName("postDao")
@IocBean
public class PostDaoImpl implements PostDao {
	
	private Dao dao = null;

	{
		Ioc ioc = new NutIoc(new JsonLoader("dao.js"));
		dao = ioc.get(Dao.class);
	}
	
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


}
