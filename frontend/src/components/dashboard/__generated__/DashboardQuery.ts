/* tslint:disable */
/* eslint-disable */
// @generated
// This file was automatically generated and should not be edited.

// ====================================================
// GraphQL query operation: DashboardQuery
// ====================================================

export interface DashboardQuery_posts_nodes_user {
  __typename: "User";
  id: string;
  name: string;
}

export interface DashboardQuery_posts_nodes {
  __typename: "Post";
  id: string;
  title: string;
  body: string;
  createdAt: any;
  user: DashboardQuery_posts_nodes_user;
}

export interface DashboardQuery_posts {
  __typename: "PostConnection";
  /**
   * A list of nodes.
   */
  nodes: DashboardQuery_posts_nodes[];
}

export interface DashboardQuery_polls_nodes_choices_nodes {
  __typename: "Choice";
  id: string;
  choiceText: string | null;
  voteCount: number;
}

export interface DashboardQuery_polls_nodes_choices {
  __typename: "ChoiceConnection";
  /**
   * A list of nodes.
   */
  nodes: DashboardQuery_polls_nodes_choices_nodes[];
}

export interface DashboardQuery_polls_nodes {
  __typename: "Poll";
  id: string;
  question: string | null;
  choices: DashboardQuery_polls_nodes_choices;
}

export interface DashboardQuery_polls {
  __typename: "PollConnection";
  /**
   * A list of nodes.
   */
  nodes: DashboardQuery_polls_nodes[];
}

export interface DashboardQuery {
  __typename: "Query";
  posts: DashboardQuery_posts;
  polls: DashboardQuery_polls;
}

export interface DashboardQueryVariables {
  postLimit: number;
  pollLimit: number;
}
