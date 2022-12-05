import { gql } from '@apollo/client';
import React from 'react';

import Post from '../shared/Post';
import { UserTopThreePostListFragment_posts as PostsType } from './__generated__/UserTopThreePostListFragment';
import classes from './UserTopThreePostList.module.scss';

const USER_TOP_THREE_POST_LIST_FRAGMENT = gql`
  fragment UserTopThreePostListFragment on User {
    posts(first: $postLimit) {
      nodes {
        ...PostFragment
      }
    }
  }
  ${Post.fragments.post}
`;

interface Props {
  posts: PostsType;
}

const UserTopThreePostList: React.FC<Props> = ({ posts }) => {
  return (
    <div className={classes.container}>
      <h2>Top Three Posts</h2>
      {posts.nodes.map((post) => (
        <Post key={post.id} post={post} short />
      ))}
    </div>
  );
};

export default Object.assign(UserTopThreePostList, {
  fragments: { user: USER_TOP_THREE_POST_LIST_FRAGMENT },
});
