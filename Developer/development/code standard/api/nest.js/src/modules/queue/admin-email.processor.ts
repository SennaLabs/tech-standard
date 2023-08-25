import { Process, Processor } from '@nestjs/bull';
import { Job } from 'bull';
import { Inject } from '@nestjs/common';
import { WINSTON_MODULE_PROVIDER } from 'nest-winston';
import { Logger } from 'winston';
import { QUEUE_ADMIN_EMAIL } from './queue.constraints';

@Processor(QUEUE_ADMIN_EMAIL)
export class AdminEmailProcessor {
  constructor(
    @Inject(WINSTON_MODULE_PROVIDER)
    private readonly logger: Logger,
  ) {}

  @Process('testing')
  async handleSendEmailVerification(job: Job<{ email: string; data: any }>) {
    this.logger.info(`RUNNING: email processor#${job.data.email}`, job.data);
    console.log('hello queueing');
    this.logger.info(`END: email processor#${job.data.email}`);
  }
}
