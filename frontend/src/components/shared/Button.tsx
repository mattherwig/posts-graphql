import React, { PropsWithChildren } from 'react';

import classes from './Button.module.scss';

const Button: React.FC<
  PropsWithChildren<
    React.DetailedHTMLProps<React.ButtonHTMLAttributes<HTMLButtonElement>, HTMLButtonElement>
  >
> = ({ children, ...props }) => {
  return (
    <button {...props} className={classes.container}>
      {children}
    </button>
  );
};

export default Button;
