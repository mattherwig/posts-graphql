import { gql, useQuery } from '@apollo/client';
import React from 'react';
import { useParams } from 'react-router-dom';

import Loading from '../shared/Loading';
import Post from '../shared/Post';
import { PostPageQuery } from './__generated__/PostPageQuery';
import classes from './PostPage.module.scss';

// noinspection GraphQLSchemaValidation
const POST_PAGE_QUERY = gql`
  query PostPageQuery($id: ID!) {
    post(id: $id) {
      ...PostFragment
    }
  }
  ${Post.fragments.post}
`;

const PostPage = () => {
  const { id } = useParams();
  const { data, loading, error } = useQuery<PostPageQuery>(POST_PAGE_QUERY, {
    variables: { id },
  });

  if (loading) return <Loading />;
  if (error || !data) throw error || new Error('Post required to load post page.');

  const { post } = data;

  return (
    <div className={classes.container}>
      <Post post={post} />
    </div>
  );
};

export default PostPage;
