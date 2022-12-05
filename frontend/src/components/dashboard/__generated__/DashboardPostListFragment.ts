/* tslint:disable */
/* eslint-disable */
// @generated
// This file was automatically generated and should not be edited.

// ====================================================
// GraphQL fragment: DashboardPostListFragment
// ====================================================

export interface DashboardPostListFragment_posts_nodes_user {
  __typename: "User";
  id: string;
  name: string;
}

export interface DashboardPostListFragment_posts_nodes {
  __typename: "Post";
  id: string;
  title: string;
  body: string;
  createdAt: any;
  user: DashboardPostListFragment_posts_nodes_user;
}

export interface DashboardPostListFragment_posts {
  __typename: "PostConnection";
  /**
   * A list of nodes.
   */
  nodes: DashboardPostListFragment_posts_nodes[];
}

export interface DashboardPostListFragment {
  __typename: "Query";
  posts: DashboardPostListFragment_posts;
}
