/* tslint:disable */
/* eslint-disable */
// @generated
// This file was automatically generated and should not be edited.

// ====================================================
// GraphQL fragment: UserTopThreePostListFragment
// ====================================================

export interface UserTopThreePostListFragment_posts_nodes_user {
  __typename: "User";
  id: string;
  name: string;
}

export interface UserTopThreePostListFragment_posts_nodes {
  __typename: "Post";
  id: string;
  title: string;
  body: string;
  createdAt: any;
  user: UserTopThreePostListFragment_posts_nodes_user;
}

export interface UserTopThreePostListFragment_posts {
  __typename: "PostConnection";
  /**
   * A list of nodes.
   */
  nodes: UserTopThreePostListFragment_posts_nodes[];
}

export interface UserTopThreePostListFragment {
  __typename: "User";
  posts: UserTopThreePostListFragment_posts;
}
