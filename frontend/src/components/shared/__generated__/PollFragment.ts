/* tslint:disable */
/* eslint-disable */
// @generated
// This file was automatically generated and should not be edited.

// ====================================================
// GraphQL fragment: PollFragment
// ====================================================

export interface PollFragment_choices_nodes {
  __typename: "Choice";
  id: string;
  choiceText: string | null;
  voteCount: number;
}

export interface PollFragment_choices {
  __typename: "ChoiceConnection";
  /**
   * A list of nodes.
   */
  nodes: PollFragment_choices_nodes[];
}

export interface PollFragment {
  __typename: "Poll";
  id: string;
  question: string | null;
  choices: PollFragment_choices;
}
