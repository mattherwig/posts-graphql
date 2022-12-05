/* tslint:disable */
/* eslint-disable */
// @generated
// This file was automatically generated and should not be edited.

// ====================================================
// GraphQL query operation: PostPageQuery
// ====================================================

export interface PostPageQuery_post_user {
  __typename: "User";
  id: string;
  name: string;
}

export interface PostPageQuery_post {
  __typename: "Post";
  id: string;
  title: string;
  body: string;
  createdAt: any;
  user: PostPageQuery_post_user;
}

export interface PostPageQuery {
  post: PostPageQuery_post;
}

export interface PostPageQueryVariables {
  id: string;
}
