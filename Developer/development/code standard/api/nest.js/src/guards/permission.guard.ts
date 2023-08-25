import { CanActivate, ExecutionContext, Injectable } from '@nestjs/common';
import { Reflector } from '@nestjs/core';
import { User } from '../entities/user.entity';
import { UsersService } from '../modules/users/rest/users.service';

interface PermissionMetaValue {
  role: string;
  action: string;
}

@Injectable()
export class PermissionGuard implements CanActivate {
  constructor(
    private readonly reflector: Reflector,
    private readonly userService: UsersService,
  ) {}

  async canActivate(context: ExecutionContext): Promise<boolean> {
    const permissions: PermissionMetaValue =
      this.reflector.get<PermissionMetaValue>(
        'permissions',
        context.getHandler(),
      );
    if (!permissions) {
      return true;
    }
    const { role, action } = permissions;
    const user: User = await this.userService.findOne(1);
    if (user.role.name !== role) {
      return false;
    }
    return !!user.role?.permissions?.find(
      (permission) => permission.name === action,
    );
  }
}
