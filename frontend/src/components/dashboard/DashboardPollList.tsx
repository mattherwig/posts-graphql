import { gql } from '@apollo/client';
import React from 'react';

import Poll from '../shared/Poll';
import { DashboardPollListFragment_polls as PollsType } from './__generated__/DashboardPollListFragment';

const DASHBOARD_POLL_LIST_FRAGMENT = gql`
  fragment DashboardPollListFragment on Query {
    polls(first: $pollLimit) {
      nodes {
        ...PollFragment
      }
    }
  }
  ${Poll.fragments.poll}
`;

interface Props {
  polls: PollsType;
}

const DashboardPollList: React.FC<Props> = ({ polls }) => {
  return (
    <div>
      <div>
        <h1>All Polls</h1>
      </div>
      {polls.nodes.map((poll) => (
        <Poll key={poll.id} poll={poll} />
      ))}
    </div>
  );
};

export default Object.assign(DashboardPollList, {
  fragments: { query: DASHBOARD_POLL_LIST_FRAGMENT },
});
