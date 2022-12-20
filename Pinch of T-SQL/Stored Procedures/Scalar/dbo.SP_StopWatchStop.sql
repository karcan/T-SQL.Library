-- =============================================
-- Author:				<Ozbal, Karcan>
-- Create date:			<2022-12-20 yyyyMMdd>
-- Description:			<Stop Watch Stop>
-- Execution script:	DECLARE @vStopWatch INT, @vElapsedMS INT, @vElapsedTime TIME(7);
--						EXEC @vStopWatch = SP_StopWatchStart
-- =============================================
CREATE PROCEDURE [dbo].[SP_StopWatchStop]
	@pStopWatch		INT,
	@pElapsedMS		INT		= NULL	OUTPUT,
	@pElapsedTime	TIME(7)	= NULL	OUTPUT
AS
BEGIN
	DECLARE @vEnd	DATETIME2(7) = SYSUTCDATETIME(),
			@vStart DATETIME2(7) = CAST(SESSION_CONTEXT(CONCAT(N'SW:', @pStopWatch)) AS DATETIME)

	SET @pElapsedMS		= DATEDIFF(MILLISECOND, @vStart, @vEnd)
	SET @pElapsedTime	= DATEADD(MILLISECOND, @pElapsedMS, 0)

	RETURN;
END