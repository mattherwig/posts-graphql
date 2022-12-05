import { gql } from '@apollo/client';
import React from 'react';

import { Card, CardBody, CardHeader } from '../shared/Card';
import { UserInfoFragment as UserType } from './__generated__/UserInfoFragment';
import classes from './UserInfo.module.scss';

const USER_INFO_FRAGMENT = gql`
  fragment UserInfoFragment on User {
    id
    email
    name
    createdAt
  }
`;

interface Props {
  user: UserType;
}

const UserInfo: React.FC<Props> = ({ user }) => {
  const { name, email, createdAt } = user;

  return (
    <Card className={classes.container}>
      <CardHeader>
        <h1>{name}</h1>
      </CardHeader>
      <CardBody className={classes.info}>
        <div className={classes.title}>
          <div>Email</div>
          <div>Created At</div>
        </div>
        <div>
          <div>{email}</div>
          <div>{createdAt}</div>
        </div>
      </CardBody>
    </Card>
  );
};

export default Object.assign(UserInfo, {
  fragments: { user: USER_INFO_FRAGMENT },
});
