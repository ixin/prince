package me.ixin.prince.post.web.command;

import me.ixin.prince.post.model.Post;

public class PostCommand {
	private Post post;

	public Post getPost() {
		if(post == null)
			post = new Post();
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}
	
}
