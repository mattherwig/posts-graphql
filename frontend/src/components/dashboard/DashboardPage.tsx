import { gql, useQuery } from '@apollo/client';
import React from 'react';

import Loading from '../shared/Loading';
import { DashboardQuery } from './__generated__/DashboardQuery';
import classes from './DashboardPage.module.scss';
import DashboardPollList from './DashboardPollList';
import DashboardPostList from './DashboardPostList';

// noinspection GraphQLSchemaValidation
const DASHBOARD_QUERY = gql`
  query DashboardQuery($postLimit: Int!, $pollLimit: Int!) {
    ...DashboardPostListFragment
    ...DashboardPollListFragment
  }
  ${DashboardPostList.fragments.query}
  ${DashboardPollList.fragments.query}
`;
const DashboardPage = () => {
  const { data, loading, error } = useQuery<DashboardQuery>(DASHBOARD_QUERY, {
    variables: { postLimit: 10, pollLimit: 5 },
  });

  if (loading) return <Loading />;
  if (error || !data) throw error || new Error('Data required to load dashboard.');

  const { posts, polls } = data;

  return (
    <div className={classes.container}>
      <DashboardPostList posts={posts} />
      <DashboardPollList polls={polls} />
    </div>
  );
};

export default DashboardPage;
