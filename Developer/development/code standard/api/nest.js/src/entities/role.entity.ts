import {
  Column,
  CreateDateColumn,
  Entity,
  JoinTable,
  ManyToMany,
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { User } from './user.entity';
import { Permission } from './permission.entity';

@Entity('roles')
export class Role {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;

  @CreateDateColumn({ readonly: true })
  createdAt: Date;

  @OneToMany(() => User, (user) => user.role)
  users: User[];

  @ManyToMany((type) => Permission)
  @JoinTable({ name: 'roles_permissions' })
  permissions: Permission[];
}
