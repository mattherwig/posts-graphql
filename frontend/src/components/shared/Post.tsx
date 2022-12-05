import { gql } from '@apollo/client';
import { parseISO } from 'date-fns';
import React from 'react';
import { Link } from 'react-router-dom';

import { PostFragment as PostType } from './__generated__/PostFragment';
import Button from './Button';
import { Card, CardBody, CardFooter, CardHeader } from './Card';
import classes from './Post.module.scss';

const POST_FRAGMENT = gql`
  fragment PostFragment on Post {
    id
    title
    body
    createdAt
    user {
      id
      name
    }
  }
`;

interface Props {
  post: PostType;
  short?: boolean;
}

const Post: React.FC<Props> = ({ post, short = false }) => {
  const { id, title, body, user } = post;

  const createdAt = parseISO(post.createdAt);
  return (
    <Card className={classes.container}>
      <CardHeader>
        <h3>{title}</h3>
      </CardHeader>
      <CardBody>
        <p className={short ? classes.short : undefined}>{body}</p>
      </CardBody>
      <CardFooter className={classes.footer}>
        <div>
          {short && (
            <Link to={`/posts/${id}`}>
              <Button type="button">Read more</Button>
            </Link>
          )}
        </div>
        <small className={classes.user}>
          <Link to={`/users/${user.id}`}>{user.name}</Link>
          <p>{createdAt.toDateString()}</p>
        </small>
      </CardFooter>
    </Card>
  );
};

export default Object.assign(Post, {
  fragments: { post: POST_FRAGMENT },
});
