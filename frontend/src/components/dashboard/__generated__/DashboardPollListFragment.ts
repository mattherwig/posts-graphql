/* tslint:disable */
/* eslint-disable */
// @generated
// This file was automatically generated and should not be edited.

// ====================================================
// GraphQL fragment: DashboardPollListFragment
// ====================================================

export interface DashboardPollListFragment_polls_nodes_choices_nodes {
  __typename: "Choice";
  id: string;
  choiceText: string | null;
  voteCount: number;
}

export interface DashboardPollListFragment_polls_nodes_choices {
  __typename: "ChoiceConnection";
  /**
   * A list of nodes.
   */
  nodes: DashboardPollListFragment_polls_nodes_choices_nodes[];
}

export interface DashboardPollListFragment_polls_nodes {
  __typename: "Poll";
  id: string;
  question: string | null;
  choices: DashboardPollListFragment_polls_nodes_choices;
}

export interface DashboardPollListFragment_polls {
  __typename: "PollConnection";
  /**
   * A list of nodes.
   */
  nodes: DashboardPollListFragment_polls_nodes[];
}

export interface DashboardPollListFragment {
  __typename: "Query";
  polls: DashboardPollListFragment_polls;
}
