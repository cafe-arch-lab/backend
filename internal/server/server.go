// Package server 서버 초기화 및 실행
package server

import (
	"github.com/labstack/echo/v4"
)

// Run 프레임워크 초기화 및 서버 실행
// DI, 미들웨어 설정
func Run() {
	e := echo.New()
	e.Logger.Fatal(e.Start(":8080"))
}
