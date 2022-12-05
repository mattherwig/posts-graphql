import { gql } from '@apollo/client';
import React from 'react';

import Post from '../shared/Post';
import { DashboardPostListFragment_posts as PostsType } from './__generated__/DashboardPostListFragment';
import classes from './DashboardPostList.module.scss';

const DASHBOARD_POST_LIST_FRAGMENT = gql`
  fragment DashboardPostListFragment on Query {
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

const DashboardPostList: React.FC<Props> = ({ posts }) => {
  return (
    <div className={classes.container}>
      <div>
        <h1>All Posts</h1>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci, delectus ipsa nam
          nesciunt non quo rem sint sunt vitae? Consequatur deleniti doloremque laborum nobis numquam
          perferendis quisquam reprehenderit sed voluptate!
        </p>
      </div>
      {posts.nodes.map((post) => {
        return <Post key={post.id} post={post} short />;
      })}
    </div>
  );
};

export default Object.assign(DashboardPostList, {
  fragments: { query: DASHBOARD_POST_LIST_FRAGMENT },
});
