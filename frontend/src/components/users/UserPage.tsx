import { gql, useQuery } from '@apollo/client';
import React from 'react';
import { Outlet, useParams } from 'react-router-dom';

import Loading from '../shared/Loading';
import { UserPageQuery } from './__generated__/UserPageQuery';
import UserInfo from './UserInfo';
import classes from './UserPage.module.scss';
import UserTopThreePostList from './UserTopThreePostList';

// noinspection GraphQLSchemaValidation
const USER_PAGE_QUERY = gql`
  query UserPageQuery($id: ID, $postLimit: Int!) {
    user(id: $id) {
      ...UserInfoFragment
      ...UserTopThreePostListFragment
    }
  }
  ${UserInfo.fragments.user}
  ${UserTopThreePostList.fragments.user}
`;

const UserPage = () => {
  const { id } = useParams();
  const { data, loading, error } = useQuery<UserPageQuery>(USER_PAGE_QUERY, {
    variables: { id: id || null, postLimit: 3 },
  });

  if (loading) return <Loading />;
  if (error || !data) throw error || new Error('User required to load user page.');

  const user = data.user;
  const { posts } = user;

  return (
    <>
      <div className={classes.container}>
        <UserInfo user={user} />
        <UserTopThreePostList posts={posts} />
      </div>
      <Outlet />
    </>
  );
};

export default UserPage;
