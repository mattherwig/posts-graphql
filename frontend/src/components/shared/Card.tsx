import classNames from 'classnames';
import React, { PropsWithChildren } from 'react';

import classes from './Card.module.scss';

interface Props {
  className?: string;
}

export const Card: React.FC<PropsWithChildren<Props>> = ({ children, className }) => {
  return <div className={classNames(classes.container, className)}>{children}</div>;
};

export const CardHeader: React.FC<PropsWithChildren<Props>> = ({ children, className }) => {
  return <div className={classNames(classes.header, className)}>{children}</div>;
};

export const CardBody: React.FC<PropsWithChildren<Props>> = ({ children, className }) => {
  return <div className={classNames(classes.body, className)}>{children}</div>;
};

export const CardFooter: React.FC<PropsWithChildren<Props>> = ({ children, className }) => {
  return <div className={classNames(classes.footer, className)}>{children}</div>;
};
