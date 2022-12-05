import { gql } from '@apollo/client';
import React from 'react';
import { default as ReactPoll } from 'react-polls';

import { PollFragment as PollType } from './__generated__/PollFragment';

const POLL_FRAGMENT = gql`
  fragment PollFragment on Poll {
    id
    question
    choices {
      nodes {
        id
        choiceText
        voteCount
      }
    }
  }
`;

interface Props {
  poll: PollType;
}

const Poll: React.FC<Props> = ({ poll }) => {
  return (
    <ReactPoll
      question={poll.question}
      answers={poll.choices.nodes.map(({ id, choiceText, voteCount }) => ({
        option: choiceText,
        votes: voteCount,
        id,
      }))}
      onVote={(voteAnswer: any) => null} // TODO
      customStyles={{ questionBold: true }}
      noStorage
    />
  );
};

export default Object.assign(Poll, {
  fragments: { poll: POLL_FRAGMENT },
});
