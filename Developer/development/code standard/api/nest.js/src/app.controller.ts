import { Controller, Get, SetMetadata, UseGuards } from '@nestjs/common';
import { AppService } from './app.service';
import { PermissionGuard } from './guards/permission.guard';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  @UseGuards(PermissionGuard)
  @SetMetadata('permissions', { role: 'admin', action: 'view' })
  getHello(): string {
    return this.appService.getHello();
  }
}
