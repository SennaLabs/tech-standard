import { InjectQueue } from '@nestjs/bull';
import { QUEUE_ADMIN_EMAIL } from './queue.constraints';
import { Queue } from 'bull';
import { Injectable } from '@nestjs/common';

@Injectable()
export class AdminEmailService {
  constructor(
    @InjectQueue(QUEUE_ADMIN_EMAIL) private readonly adminEmailQueue: Queue,
  ) {}

  async addEmailVerificationQueue(data: any) {
    await this.adminEmailQueue.add('testing', { ...data });
  }
}
