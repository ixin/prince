package me.ixin.prince.post.dao;

import me.ixin.prince.post.model.Post;

public interface PostDao {
	/**
	 * 插入一条post
	 * @param post
	 * @return
	 */
	public Post savePost(Post post);
	/**
	 * 更新一条post
	 * @param post
	 * @return
	 */
	public int updatePost(Post post);
	/**
	 * 按id删除一条post
	 * @param id
	 * @return
	 */
	public int delPost(Long id);
	/**
	 * 按id查找一条post
	 * @param id
	 * @return
	 */
	public Post findPostByID(Long id);
}
