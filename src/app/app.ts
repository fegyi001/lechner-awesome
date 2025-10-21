import { Component, ElementRef, inject, signal } from '@angular/core';
import { RouterOutlet } from '@angular/router';

@Component({
  selector: 'app-root',
  imports: [RouterOutlet],
  templateUrl: './app.html',
  styleUrl: './app.scss',
})
export class App {
  protected readonly title = signal('lechner-awesome');
  protected readonly _elementRef = inject(ElementRef);

  ngOnInit() {
    this._removeAngularVersion();
  }

  protected _removeAngularVersion() {
    this._elementRef.nativeElement.removeAttribute('ng-version');
  }
}
