import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './modules/app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { LoginComponent } from './components/pages/login/login.component';
import { RegisterComponent } from './components/pages/register/register.component';
import { HomeComponent } from './components/pages/home/home.component';
import { ToolbarComponent } from './components/shared/toolbar/toolbar.component';
import { UserItemComponent } from './components/items/user-item/user-item.component';
import { PostItemComponent } from './components/items/post-item/post-item.component';
import { DeletePostDialogComponent } from './components/dialogs/delete-post-dialog/delete-post-dialog.component';
import { GiveAdminDialogComponent } from './components/dialogs/give-admin-dialog/give-admin-dialog.component';
import { MaterialImportsModule } from './modules/material-imports.module';
import { FormsModule } from '@angular/forms';
import { ReactiveFormsModule } from '@angular/forms';
import { PageNotFoundComponent } from './components/pages/page-not-found/page-not-found.component';
import { BackgroundComponent } from './components/pages/background/background.component';
import { FlexLayoutModule } from '@angular/flex-layout';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    RegisterComponent,
    HomeComponent,
    ToolbarComponent,
    UserItemComponent,
    PostItemComponent,
    DeletePostDialogComponent,
    GiveAdminDialogComponent,
    PageNotFoundComponent,
    BackgroundComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MaterialImportsModule,
    FormsModule,
    ReactiveFormsModule,
    FlexLayoutModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
