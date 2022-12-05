/* tslint:disable */
/* eslint-disable */
// @generated
// This file was automatically generated and should not be edited.

// ====================================================
// GraphQL query operation: UserPageQuery
// ====================================================

export interface UserPageQuery_user_posts_nodes_user {
  __typename: "User";
  id: string;
  name: string;
}

export interface UserPageQuery_user_posts_nodes {
  __typename: "Post";
  id: string;
  title: string;
  body: string;
  createdAt: any;
  user: UserPageQuery_user_posts_nodes_user;
}

export interface UserPageQuery_user_posts {
  __typename: "PostConnection";
  /**
   * A list of nodes.
   */
  nodes: UserPageQuery_user_posts_nodes[];
}

export interface UserPageQuery_user {
  __typename: "User";
  id: string;
  email: string;
  name: string;
  createdAt: any;
  posts: UserPageQuery_user_posts;
}

export interface UserPageQuery {
  user: UserPageQuery_user;
}

export interface UserPageQueryVariables {
  id?: string | null;
  postLimit: number;
}
