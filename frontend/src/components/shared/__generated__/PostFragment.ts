/* tslint:disable */
/* eslint-disable */
// @generated
// This file was automatically generated and should not be edited.

// ====================================================
// GraphQL fragment: PostFragment
// ====================================================

export interface PostFragment_user {
  __typename: "User";
  id: string;
  name: string;
}

export interface PostFragment {
  __typename: "Post";
  id: string;
  title: string;
  body: string;
  createdAt: any;
  user: PostFragment_user;
}
