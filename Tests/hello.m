/* Tests/hello.m

   Copyright (C) 2012 Free Software Foundation, Inc.

   Author: Ivan Vucica <ivan@vucica.net>
   Date: May 2012

   This file is part of QuartzCore.

   This library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2 of the License, or (at your option) any later version.

   This library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with this library; see the file COPYING.LIB.
   If not, see <http://www.gnu.org/licenses/> or write to the
   Free Software Foundation, 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.
*/

#if !(__APPLE__)
#import <GL/gl.h>
#else
#import <OpenGL/OpenGL.h>
#endif

#import "QCTestOpenGLView.h"

@interface HelloOpenGLView : QCTestOpenGLView
{

}

- (void) timerAnimation: (NSTimer *)aTimer;

@end

Class classOfTestOpenGLView()
{
  return [HelloOpenGLView class];
}

@implementation HelloOpenGLView

- (void) timerAnimation: (NSTimer *)aTimer
{
  [[self openGLContext] makeCurrentContext];

  glViewport(0, 0, [self frame].size.width, [self frame].size.height);
 
  glClear(GL_COLOR_BUFFER_BIT);
  glMatrixMode(GL_PROJECTION);
  glLoadIdentity();
  /*
  glOrtho(0, 0, [self frame].size.width, [self frame].size.height, -1, 1);
   */

  glMatrixMode(GL_MODELVIEW);
  glLoadIdentity();
  
  // Using glBegin() in a small test like this one shouldn't be a problem.
  glBegin(GL_TRIANGLES);
  glColor3f(1.0, 0.0, 0.0);
  glVertex2f(0.0, 0.0);
  glColor3f(0.0, 1.0, 0.0);
  glVertex2f(1.0, 0.0);
  glColor3f(0.0, 0.0, 1.0);
  glVertex2f(1.0, 1.0);
  glEnd();

  [[self openGLContext] flushBuffer];
}

@end

/* vim: set cindent cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1 expandtabs shiftwidth=2 tabstop=8: */
