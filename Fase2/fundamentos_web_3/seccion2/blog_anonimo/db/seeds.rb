post1 = Post.create(title: "Titulo1", body: "Contenido 1")
post2 = Post.create(title: "Titulo2", body: "Contenido 2")
post3 = Post.create(title: "Titulo3", body: "Contenido 3")

tag1 = Tag.create(tag: "Ciencia")
tag2 = Tag.create(tag: "Tecnologia")

post_tag1 = PostTag.create(post_id: post1.id, tag_id: tag1.id)
post_tag2 = PostTag.create(post_id: post1.id, tag_id: tag2.id)
post_tag3 = PostTag.create(post_id: post2.id, tag_id: tag2.id)
post_tag4 = PostTag.create(post_id: post3.id, tag_id: tag2.id)