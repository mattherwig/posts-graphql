import React from 'react';
import { createBrowserRouter } from 'react-router-dom';

import AboutPage from './about/AboutPage';
import AppErrorBoundary from './AppErrorBoundary';
import AppLayout from './AppLayout';
import DashboardPage from './dashboard/DashboardPage';
import PostPage from './posts/PostPage';
import UserPage from './users/UserPage';

export const APP_ROUTES = [
  {
    element: <AppLayout />,
    hasErrorBoundary: true,
    errorElement: <AppErrorBoundary />,
    handle: { crumb: 'Home' },
    children: [
      {
        path: '/',
        handle: { crumb: 'Dashboard' },
        element: <DashboardPage />,
      },
      {
        path: 'posts',
        handle: { crumb: 'Posts' },
        children: [
          {
            path: ':id',
            element: <PostPage />,
          },
        ],
      },
      {
        path: 'users',
        handle: { crumb: 'Users' },
        children: [
          {
            path: ':id',
            handle: { crumb: 'User' },
            element: <UserPage />,
          },
          {
            path: 'profile',
            handle: { crumb: 'My Profile' },
            element: <UserPage />,
          },
        ],
      },
      {
        path: 'about',
        handle: { crumb: 'About' },
        element: <AboutPage />,
      },
    ],
  },
];

export const router = createBrowserRouter(APP_ROUTES);
